class AddPatientIdToSymptoms < ActiveRecord::Migration
  def change
    add_column :symptoms, :patient_id, :integer
  end
end
