patients_list = [
	["Matt", "Doomstone", "1000 Hiltop Circle", "Catonsvile", "MD", "21258", Time.now],
	["Joe", "Skyes", "1000 Park Street", "Jacksonville", "FL", "32099", Time.now],
	["Larry", "Williams", "100 Main Street", "Boston", "MA", "02201", Time.now],
	["John", "Dingleberry", "20 Massachusets Street", "Lawrence", "KS", "66044", Time.now]
	]

patients_list.each do |patient|
	Patient.create(:first_name => patient[0], :last_name => patient[1], :address => patient[2], :city => patient[3], :state => patient[4], :zip => patient[5], :created_at => patient[6], :updated_at => patient[6])
end

symptom_list = [
	["Diabetes mellitus", Time.now, 1],
	["Obesity", Time.now, 1],
	["Acute lung injury", Time.now, 2],
	["Neonatal respiratory distress syndrome", Time.now, 2],
	["Hepatitis C virus infection", Time.now, 3],
	["Cancer", Time.now, 4],
	["Cystic fibrosis", Time.now, 4],
]

symptom_list.each do |symptoms|
	Symptom.create(:name => symptoms[0], :created_at => symptoms[1], :updated_at => symptoms[1], :patient_id => symptoms[2])
end	