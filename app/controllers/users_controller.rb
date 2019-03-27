def create
    @user = Users.new(person_params)
 
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      # re-render the :new template WITHOUT throwing away the invalid @person
      render :new
    end

    def destroy
    Person.find(params[:id]).destroy
    redirect_to people_url
  end
  end