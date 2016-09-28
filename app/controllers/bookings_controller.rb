class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def home
    render layout: "application2"
  end

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
      if @booking.save
        client = params[:booking][:email]
        prestige = "canache39@gmail.com"
        Notifier.send_booking_request(client, params[:booking][:name], params[:booking]).deliver_now
        Notifier.send_booking_request(prestige, "Prestige", params[:booking]).deliver_now
        
        redirect_to :action => 'new', notice: "Booking was successfully created."
      else
        redirect_to :action => 'new', alert: "Something wrong happened, please try again"
      end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contact_email
    recipient = "canache39@gmail.com"
    if Contact.send_form(recipient, params).deliver_now
      respond_to do |format|
        format.json { render json: 1 }
      end
    else
      respond_to do |format|
        format.json { render json: 0 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:name, :email, :phone, :pax, :pickup, :destiny, :hour, :ondate, :comment)
    end
end
