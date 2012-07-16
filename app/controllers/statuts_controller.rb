class StatutsController < ApplicationController
  # GET /statuts
  # GET /statuts.json
  def index
    @statuts = Statut.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @statuts }
    end
  end

  # GET /statuts/1
  # GET /statuts/1.json
  def show
    @statut = Statut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @statut }
    end
  end

  # GET /statuts/new
  # GET /statuts/new.json
  def new
    @statut = Statut.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @statut }
    end
  end

  # GET /statuts/1/edit
  def edit
    @statut = Statut.find(params[:id])
  end

  # POST /statuts
  # POST /statuts.json
  def create
    @statut = Statut.new(params[:statut])

    respond_to do |format|
      if @statut.save
        format.html { redirect_to @statut, :notice => 'Statut was successfully created.' }
        format.json { render :json => @statut, :status => :created, :location => @statut }
      else
        format.html { render :action => "new" }
        format.json { render :json => @statut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statuts/1
  # PUT /statuts/1.json
  def update
    @statut = Statut.find(params[:id])

    respond_to do |format|
      if @statut.update_attributes(params[:statut])
        format.html { redirect_to @statut, :notice => 'Statut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @statut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statuts/1
  # DELETE /statuts/1.json
  def destroy
    @statut = Statut.find(params[:id])
    @statut.destroy

    respond_to do |format|
      format.html { redirect_to statuts_url }
      format.json { head :no_content }
    end
  end
end
