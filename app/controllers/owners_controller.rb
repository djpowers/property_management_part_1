class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to new_owner_path, notice: 'Owner was successfully recorded.'
    else
      render 'new'
    end
  end

  def destroy
    @owner = Owner.find(params[:id])

    @owner.destroy
    redirect_to owners_path, notice: 'Owner was successfully deleted.'
  end

  private

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email)
    end

end
