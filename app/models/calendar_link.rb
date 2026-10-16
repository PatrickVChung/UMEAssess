class CalendarLink < ApplicationRecord
  belongs_to :advisor
  has_rich_text :description
  before_save :ensure_links_open_in_new_tab

  private

  def ensure_links_open_in_new_tab
    rich_text_attribute = self.description # Match this to your rich text attribute name
    return unless rich_text_attribute.present?

    doc = Nokogiri::HTML::DocumentFragment.parse(rich_text_attribute.body.to_html)
    doc.css('a').each do |a|
      a['target'] = '_blank'
      a['rel'] = 'noopener noreferrer' # Security best practice
    end

    rich_text_attribute.body = doc.to_html
  end
end
