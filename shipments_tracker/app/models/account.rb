class Account < ApplicationRecord
   # Validación para asegurarse de que el campo company_name no esté vacío
   validates :company_name, presence: true

   # Validación para asegurarse de que el campo active sea un valor booleano
   validates :active, inclusion: { in: [true, false] }
 
   # Validación para asegurarse de que el campo id sea único
   validates :id, uniqueness: true
end
