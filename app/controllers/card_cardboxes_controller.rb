class CardCardboxesController < ApplicationController
  # GET /card_cardboxes
  # GET /card_cardboxes.xml
  def index
    @card_cardboxes = CardCardbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @card_cardboxes }
    end
  end

  # GET /card_cardboxes/1
  # GET /card_cardboxes/1.xml
  def show
    @card_cardbox = CardCardbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card_cardbox }
    end
  end

  # GET /card_cardboxes/new
  # GET /card_cardboxes/new.xml
  def new
    @card_cardbox = CardCardbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card_cardbox }
    end
  end

  # GET /card_cardboxes/1/edit
  def edit
    @card_cardbox = CardCardbox.find(params[:id])
  end

  # POST /card_cardboxes
  # POST /card_cardboxes.xml
  def create
    @card_cardbox = CardCardbox.new(params[:card_cardbox])

    respond_to do |format|
      if @card_cardbox.save
        format.html { redirect_to(@card_cardbox, :notice => 'Card cardbox was successfully created.') }
        format.xml  { render :xml => @card_cardbox, :status => :created, :location => @card_cardbox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card_cardbox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /card_cardboxes/1
  # PUT /card_cardboxes/1.xml
  def update
    @card_cardbox = CardCardbox.find(params[:id])

    respond_to do |format|
      if @card_cardbox.update_attributes(params[:card_cardbox])
        format.html { redirect_to(@card_cardbox, :notice => 'Card cardbox was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card_cardbox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /card_cardboxes/1
  # DELETE /card_cardboxes/1.xml
  def destroy
    @card_cardbox = CardCardbox.find(params[:id])
    @card_cardbox.destroy

    respond_to do |format|
      format.html { redirect_to(card_cardboxes_url) }
      format.xml  { head :ok }
    end
  end
end
