ActiveAdmin.register Mission do
  permit_params :title,
                :description,
                :visible
end
