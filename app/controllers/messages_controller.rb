class MessagesController < ApplicationController
  def index
    @game_skill = GameSkill.find(params[:game_skill_id])
    @messages = @game_skill.messages
    @message = Message.new
  end

  def create
    @game_skill = GameSkill.find(params[:game_skill_id])
    @message = Message.new( user: current_user,
                  game_skill: @game_skill,
                  content: message_params[:content]
                )
    if @message.save
      redirect_to game_skill_messages_path(@game_skill)
    else
      @messages = @game_skill.messages
      render :index
    end
  end

  def destroy
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
