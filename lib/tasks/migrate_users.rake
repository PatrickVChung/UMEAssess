namespace :users do
  desc "Migrate users from REDEI to UMEAssess"
  task migrate: :environment do
    batch_size = 500

    RedeiUser.find_in_batches(batch_size: batch_size) do |batch|
      puts "Migrating batch of #{batch.size}"

      batch.each do |u|
        if AssessUser.exists?(id: u.id)
          puts "Skipping existing user #{u.id} (#{u.username})"
          next
        end

        AssessUser.find_or_create_by(
          id: u.id,
          username: u.username,
          email: u.email,
          password_digest: u.encrypted_password,
          full_name: u.full_name,
          is_ldap: u.is_ldap,
          sid: u.sid,
          permission_group_id: u.permission_group_id,
          prev_permission_group_id: u.prev_permission_group_id,
          roles: u.roles,
          cohort_id: u.cohort_id,
          coaching_type: u.coaching_type,
          uuid: u.uuid,
          subscribed: u.subscribed,
          matriculated_date: u.matriculated_date,
          new_competency: u.new_competency,
          former_name: u.former_name,
          career_interest: u.career_interest,
          last_sign_in_at: u.last_sign_in_at,
          last_sign_in_ip: u.last_sign_in_ip,
          created_at: u.created_at,
          updated_at: u.updated_at
        )
      end
    end

    puts "Migration complete."
  end
end
