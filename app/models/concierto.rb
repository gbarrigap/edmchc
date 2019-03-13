class Concierto < ApplicationRecord
  belongs_to :encuentro

  has_many_attached :fotos

  default_scope { order(:fecha, :hora) }

  def fecha_display
    I18n.l(fecha, format: :day_name_day_number_month_name)
  end

  def fecha_corta
    fecha.strftime('%d/%m/%y')
  end

  def hora_display
    I18n.l(hora, format: :short)
  end

  def tiene_video?
    video_url != nil && video_url != ''
  end
end
