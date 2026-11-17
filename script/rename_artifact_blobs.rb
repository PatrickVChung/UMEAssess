old_fragment = "NSF_Formative_Feedback"
new_fragment = "NSF_Formative_CSA_Qualtrics"
dry_run = ENV["APPLY"] != "true"

Attachment = ActiveStorage::Attachment
Blob = ActiveStorage::Blob

scope = Attachment.includes(:blob).where(record_type: "Artifact")
matched = 0
skipped_shared = 0

Attachment.transaction do
  scope.find_each do |attachment|
    blob = attachment.blob
    old_name = blob.filename.to_s
    next unless old_name.include?(old_fragment)

    new_name = old_name.sub(old_fragment, new_fragment)
    matched += 1

    if blob.attachments.size > 1
      # Avoid mutating a deduplicated blob used by other records
      skipped_shared += 1
      puts "[SHARED BLOB] Attachment##{attachment.id} (Artifact##{attachment.record_id}): #{old_name} -> #{new_name}"
      next
    end

    puts "[#{dry_run ? 'DRY RUN' : 'UPDATED'}] Attachment##{attachment.id} (Artifact##{attachment.record_id}): #{old_name} -> #{new_name}"
    blob.update!(filename: new_name) unless dry_run
  end
end

puts "Matched: #{matched}, Shared blobs skipped: #{skipped_shared}, Mode: #{dry_run ? 'DRY RUN (set APPLY=true to commit)' : 'COMMITTED'}"
