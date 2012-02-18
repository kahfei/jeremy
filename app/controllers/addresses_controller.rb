class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.xml
  def index
    @addresses = Address.all
    @address = Address.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to(addresses_url, 
          :notice => 'Address was created') }
        format.js
      else
        format.html { redirect_to(addresses_url)}
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to(@address, :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.js
    end
  end


end
