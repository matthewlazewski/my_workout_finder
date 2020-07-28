module WorkoutHelper
    def display_category(c)
        if params[:category_id]
            c.hidden_field :category_id 
        else 
            render partial: 'categories/form', locals: {f: c}
        end
    end
end