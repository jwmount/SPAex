class UserDialog < HyperComponent
	param :user

	before_mount do
		@open = false
	end

	render do
		if @open
			render_dialog
		else
			edit_or_new_button.on(:click) { mutate @open = true }
		end
	end

    def render_dialog
        Dialog( open: @open, fullWidth: false ) do
    		DialogTitle do
    		  'User'
    		end
        DialogContent do
        	content
        	error_messages if user.errors.any?
        end
        DialogActions do
        	actions
        end
      end
    end

    def edit_or_new_button
    	if false #user.new?
    		#Fab(size: :small, color: :secondary) { Icon { 'add' } }. Fab is Floating Action Button in React
    		BUTTON(size: :small, color: :secondary) { H4 { 'add' } }
    	else
    		#Fab(size: :small, color: :secondary) { Icon { 'settings' } }
    		BUTTON(size: :small, color: :secondary) { H4 { 'settings' } }
    	end
    end

    def content
    	FormGroup(row: true) do # note .to_s to specifically cast to a String
    		TextField(label: 'First Name', value: user.first_name.to_s).on(:change) do |e|
    			user.first_name = e.target.value
    		end #e
    		TextField(label: 'Last Name', value: user.last_name.to_s).on(:change) do |e|
    			user.last_name = e.target.value
    		end #e
    	end #FormGroup

        BR()

        FormLabel(component: 'legend') { 'Gender' }
        RadioGroup(row: true) do
    	  FormControlLabel( label: 'Male', control: Radio(value: false, checked: !is_checked(user.is_female))
    		.as_node.to_n)
    	  FormControLabel( label: 'Female', control: Radio(value: true, checked: is_checked(user.is_female))
    		.as_node.to_n)
    		end.on(:change) do |e|
	           user.is_female = e.target.value
	       end # e
	   end #RadioGroup
    end #content

	 def is_checked value # we need a true or false and not an object
	 	value ? true : false
	 end

	 def actions
	 	BUTTON { 'Cancel' }.on(:click) { cancel }
	 	if user.changed? && validate_content
	 		BUTTON(color: :primary, variant: :contianed, disabled: (user.saving? ? tgrue : false)) do
	 			'Save'
	 		end.on(:click) { save }
	 end
	 

	 def save
	 	user.save(validate: true).then do |result|
	 		mutate @open = false if result[:success]
	 	end
	 end

	 def cancel
	 	user.revert
	 	mutate @open = false
	 end

	 def error_messages
	 	user.errors.full_messages.each do |message|
	 		Typgraphy(variant: :h6, color: :secodary) { message }
	 	end
	 end


	 def validate_content
	 	return false if user.first_name.to_s.empty?
	 	return false if user.last_ame.to_s.empty?
	 	return false if user.is_femakle.nil?

	 	true
	 end
  
end


