class ContactsController < ApplicationController

  def show
    @user = User.find_by({"id" => session["user_id"]})
    @contact = Contact.find_by({ "id" => params["id"] })
    @company = Company.find_by({ "id" => @contact["company_id"] })
    @activities = Activity.where({ "contact_id" => @contact["id"], "user_id" =>["user_id"] })
  end

  def new
    @company = Company.find_by({ "id" => params["company_id"] })
  end

  def create
    @contact = Contact.new
    @contact["first_name"] = params["first_name"]
    @contact["last_name"] = params["last_name"]
    @contact["email"] = params["email"]
    @contact["phone_number"] = params["phone_number"]
    @contact["company_id"] = params["company_id"]
    @contact.save
    redirect_to "/companies/#{@contact["company_id"]}"
  end

  def edit
    @contact = Contact.find_by({ "id" => params["id"] })
    @company = Company.find_by({ "id" => @contact["company_id"] })
  end
  
  def update
    @contact = Contact.find_by({ "id" => params["id"] })
    @contact["first_name"] = params["first_name"]
    @contact["last_name"] = params["last_name"]
    @contact["email"] = params["email"]
    @contact["phone_number"] = params["phone_number"]
    @contact.save
    redirect_to "/contacts/#{@contact["id"]}"
  end

  def destroy
    @contact = Contact.find_by({ "id" => params["id"] })
    @contact.destroy
    redirect_to "/companies/#{@contact["company_id"]}"
  end

end