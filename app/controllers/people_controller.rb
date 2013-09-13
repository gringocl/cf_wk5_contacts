class PeopleController < ApplicationController
  before_filter :load_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @person.build_address
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  private
    def person_params
      params.require(:person).permit(
        :first_name, :last_name, :phone,
        addresses_attributes: [:id, :street_address, :city, :state, :zipcode])
    end

    def load_person
      @person = Person.find(params[:id])
    end
end
