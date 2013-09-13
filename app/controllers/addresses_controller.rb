class AddressesController < ApplicationController
  before_filter :load_person
  before_filter :load_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @person.addresses
  end

  def new
    @address = Address.new(params[:person])
  end

  def edit
  end

  private

    def load_person
      @person = Person.find(params[:person_id])
    end

    def load_address
      @person.addresses.find(params[:id])
    end
end
