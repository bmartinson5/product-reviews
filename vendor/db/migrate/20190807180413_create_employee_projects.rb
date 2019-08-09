class CreateEmployeeProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_projects do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
    end
  end
end
