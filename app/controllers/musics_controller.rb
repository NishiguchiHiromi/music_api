class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :update, :destroy]
  #skip_before_filter :verify_authenticity_token
  # GET /musics
  def index
    @musics = Music.all.select(:title,:id)
    render json: @musics
  end

  # GET /musics/1
  def show
    data={}
    music = @music
    notes = music.notes.order(:bar_order, :note_order)

    data = Hash.new( Hash.new( {} ) )
    data["no"] = music.no
    data["title"] = music.title
    data["source"] = music.source
    data["meter"] = {numerator: music.meter.split("/")[0].to_i, denominator: music.meter.split("/")[1].to_i}
    data["noteLength"] = {numerator: music.note_length.split("/")[0].to_i, denominator: music.note_length.split("/")[1].to_i}
    data["tempo"] = {length:{numerator: music.tempo[0,music.tempo.index("/")].to_i,
                             denominator:music.tempo[music.tempo.index("/")+1,music.tempo.index("=")-music.tempo.index("/")-1].to_i},
                     tempo: music.tempo[music.tempo.index("=")+1,music.tempo.length-music.tempo.index("=")-1].to_i}
    data["reference"] = music.reference
    data["key"] = music.key
    data["music"] = []
    notes.each{|note|
      if note.bar_order >= data["music"].length
        data["music"] << []
      end
      data["music"][note.bar_order] << {note: note.note, length: note.length, x:0, y:0}
    }

    logger.debug(data)
=begin
    data = {
       no:1,
       title: "title",
       composer: "ore",
       source: "so-su",
       meter: "4/4",
       noteLength: "1/4",
       tempo: "1/4=60",
       reference: "りふぁ",
       key: "C",
       music: "CDEF|GABc|BAGF|EDC2|CDEF|GABc|BAGF|EDC2||"
    }

=end
    render json: data

  end

  # POST /musics
  def create
    json_request = JSON.parse(request.body.read)
    Music.transaction do
      Note.transaction do
        music_params = json_request["music"]
        music_params["user_id"] = 1
        music = Music.new(music_params)
        music.save!
        notes_params = json_request["notes"]
        notes_params.each_with_index{|bar, bar_index|
          bar.each_with_index{|note, note_index|
            new_note = Note.new
            new_note.music_id = music.id
            new_note.bar_order = bar_index
            new_note.note_order = note_index
            new_note.note = note["note"]
            new_note.length = note["length"]
            new_note.save!
          }
        }
      end
    end
    render json: {result:"OK"}
    rescue => e
    render json: {result:"NG"}
  end

  # PATCH/PUT /musics/1
  def update
    if @music.update(music_params)
      render json: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musics/1
  def destroy
    @music.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end
=begin
    # Only allow a trusted parameter "white list" through.

    def music_params
      params.require(:music).permit(:name)
    end
=end
end
