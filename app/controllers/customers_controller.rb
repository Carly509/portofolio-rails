
def new
   @customer = Customer.new 
end

def create
     @customer = Customer.create customer_params(:name, :username, :email, :password)
		redirect_to customer_path(@customer)

end

