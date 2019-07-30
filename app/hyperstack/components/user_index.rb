class UserIndex < HyperComponent

  render(DIV, class: 'mo-page') do
    
    @user = User.new(first_name: 'George', last_name: 'Smith', gender: false)
    UserDialog(@user)
    #UserDialog(user: User.new) # this will render as a button to add users

    TABLE do
      THEAD do                   #TABLEHEAD do               #TableHead do
        TR do                    #TABLEROW do              #TableRow do
          TH { 'Name' }          #TableCell { 'Name' }
          TH { 'Gender' }        #TABLECELL { 'Gender'}  #TableCell { 'Gender' }
          TH { 'Edit' }          #TABLECELL { 'Edit' }   #TableCell { 'Edit' }
        end
      end
      TBODY do                   #TABLEBODY do               #TableBody do
        user_rows
      end
    end
  end

  def user_rows
    User.each do |user| # note User is a Hyperstack model (see later in the Isomorphic section)
      TR do        #TableRow do
        TD { "#{user.first_name} #{user.last_name}" } #was TableCell {}
        TD { user.gender ? 'Female' : 'Male' }      #was TableCell{}, note the use of key so React knows which Component this refers to
        TD { UserDialog( user: user, key: user.id) }   #was TableCell {} this will render as an edit button
      end
    end
  end

end

