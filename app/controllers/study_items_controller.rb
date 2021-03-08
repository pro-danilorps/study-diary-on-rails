class StudyItemsController < ApplicationController
  def index
    @study_items = StudyItem.all
  end

  def new
    @study_item = StudyItem.new
  end

  def create
    @study_item = StudyItem.new(study_item_params)

    if @study_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @study_item = StudyItem.find(params[:id])
  end

  def update
    @study_item = StudyItem.find(params[:id])

    if @study_item.update(study_item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    study_item = StudyItem.find(params[:id])
    study_item.destroy

    redirect_to root_path
  end

  private
    def study_item_params
      params.require(:study_item).permit(:title, :category)
    end
end
