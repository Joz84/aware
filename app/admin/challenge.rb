ActiveAdmin.register Challenge do
  permit_params :title,
                :description,
                :visible,
                :category_id

end
