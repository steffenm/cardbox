class CardboxesController < ApplicationController
  # GET /cardboxes
  # GET /cardboxes.xml
  def index
    @cardboxes = current_user.cardboxes.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cardboxes }
    end
  end

  # GET /cardboxes/1
  # GET /cardboxes/1.xml
  def show
    @cardbox = current_user.cardboxes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cardbox }
    end
  end

  # GET /cardboxes/new
  # GET /cardboxes/new.xml
  def new
    @cardbox = current_user.cardboxes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cardbox }
    end
  end

  # GET /cardboxes/1/edit
  def edit
    @cardbox = current_user.cardboxes.find(params[:id])
  end

  # POST /cardboxes
  # POST /cardboxes.xml
  def create
    @cardbox = current_user.cardboxes.new(params[:cardbox])

    respond_to do |format|
      if @cardbox.save
        format.html { redirect_to(@cardbox, :notice => _('Der Karteikasten wurde angelegt.')) }
        format.xml  { render :xml => @cardbox, :status => :created, :location => @cardbox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cardbox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cardboxes/1
  # PUT /cardboxes/1.xml
  def update
    @cardbox = current_user.cardboxes.find(params[:id])

    respond_to do |format|
      if @cardbox.update_attributes(params[:cardbox])
        format.html { redirect_to(@cardbox, :notice => _('Der Karteikasten wurde geändert')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cardbox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cardboxes/1
  # DELETE /cardboxes/1.xml
  def destroy
    raise 'Yet not implemented'
    @cardbox = current_user.cardboxes.find(params[:id])
    @cardbox.destroy

    respond_to do |format|
      format.html { redirect_to(cardboxes_url) }
      format.xml  { head :ok }
    end
  end
end
