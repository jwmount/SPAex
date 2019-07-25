
class UserIndex < HyperComponent

  render(DIV, class: 'mo-page') do
    
    UserDialog(user: User.new) # this will render as a button to add users

    Table do
      TableHead do
        TableRow do
          TableCell { 'Name' }
          TableCell { 'Gender' }
          TableCell { 'Edit' }
        end
      end
      TableBody do
        user_rows
      end
    end
  end

  def user_rows
    User.each do |user| # note User is a Hyperstack model (see later in the Isomorphic section)
      TableRow do
        TableCell { "#{user.first_name} #{user.last_name}" }
        TableCell { user.is_female ? 'Female' : 'Male' }  #note the use of key so React knows which Component this refers to
        TableCell { UserDialog( user: user, key: user.id) } # this will render as an edit button
      end
    end
  end

end

