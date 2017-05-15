module ApplicationHelper
  def add_hidden_class
    "navbar-hidden" if is_index
  end

  private
    def is_index
      controller_name == "cocktails" && action_name =="index"
    end
end


