class MigrateSummarytoRichSummaryBooks < ActiveRecord::Migration[6.1]
  def change
    def up
      Book.find_each do |book|
        book.update(rich_summary: book.summary)
      end
    end
  
    def down
      Book.find_each do |book|
        book.update(summary: book.rich_summary)
        book.update(rich_summary: nil)
      end
    end
  end
end
