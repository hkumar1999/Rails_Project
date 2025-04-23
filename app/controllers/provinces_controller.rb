class ProvincesController < ApplicationController
    def taxes
      province = Province.find(params[:id])
      render json: {
        pst: province.pst.to_f,
        gst: province.gst.to_f,
        hst: province.hst.to_f
      }
    end
  end
  