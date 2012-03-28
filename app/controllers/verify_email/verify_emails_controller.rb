module VerifyEmail
  class VerifyEmailsController < ApplicationController

    def verify
      @verify_email = VerifyEmail.not_expired.find_by_hash_key( params[:hash_key])
      if @verify_email
        if @verify_email.verified?
          redirect_to(verified_verify_email_path(@verify_email.hash_key)) and return false
        end
        VerifyEmail.update_all("verified=1", "email='#{@verify_email.email}'")
        redirect_to(@verify_email.continue_to)
      else
        flash[:error] = "We could not find a valid verification code. Please load the link from an email verification message before the link expires."
        redirect_to('new')
      end
    end

    def index
      new
      render('new')
    end

    # GET /verify_emails/1
    # GET /verify_emails/1.json
    def show
      @verify_email = VerifyEmail.find(params[:id])
      if @verify_email
        if @verify_email.verified?
          redirect_to(verified_verify_email_path(@verify_email.hash_key)) and return false
        end
        opts = { from: ::VerifyEmail::From, verify_email: @verify_email }
        @mailer = VerifyEmailMailer.verify_email( @verify_email.email, opts )
        @mailer.deliver
      end
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @verify_email }
      end
    end

    # GET /verify_emails/new
    # GET /verify_emails/new.json
    def new
      session[:continue_to] = params[:continue_to] if params[:continue_to]
      @verify_email = VerifyEmail.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @verify_email }
      end
    end

    # GET /verify_emails/1/edit
#    def edit
#      @verify_email = VerifyEmail.find(params[:id])
#    end

    # POST /verify_emails
    # POST /verify_emails.json
    def create
      @verify_email = VerifyEmail.new(email: params[:verify_email][:email], continue_to: session[:continue_to])

      respond_to do |format|
        if @verify_email.save
          format.html { redirect_to @verify_email, notice: 'Verify email was successfully created.' }
          format.json { render json: @verify_email, status: :created, location: @verify_email }
        else
          format.html { render action: "new" }
          format.json { render json: @verify_email.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /verify_emails/1
    # PUT /verify_emails/1.json
    #
    # updates are not allowed. Submission from #show will #create.
    #
    def update
      create
    end

    # DELETE /verify_emails/1
    # DELETE /verify_emails/1.json
#    def destroy
#      @verify_email = VerifyEmail.find(params[:id])
#      @verify_email.destroy
#
#      respond_to do |format|
#        format.html { redirect_to verify_emails_url }
#        format.json { head :no_content }
#      end
#    end
  end
end
