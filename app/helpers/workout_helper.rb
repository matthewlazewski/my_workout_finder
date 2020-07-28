module WorkoutHelper
    def display_category(c)
        if params[:category_id]
            c.hidden_field :category_id
        else 
            render partial: 'category_select', locals: {f: c}
        end
    end
end