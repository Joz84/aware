ActiveAdmin.register Challenge do
  permit_params :title,
                :description,
                :mission_id,
                :category_id

end
