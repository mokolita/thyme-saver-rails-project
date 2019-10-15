# class ApplicationController::TAPIManager
#     require HTTParty
#     BASE_URL = "https://trefle.io/"
#     AUTH_HEADER = {headers: {Authorization: "Bearer c3Buc2ptUTN5ZllFYitPSEVHYnlyZz09"}}


#     def self.get_plant_by_id(id)
#         url = BASE_URL + "/api/plants/#{id}"
#         return HTTParty.get(url, AUTH_HEADER)
#     end

#     def self.search_plant_by_name(name)
#         url = BASE_URL + "/api/plants?q=#{name}"
#         return HTTParty.get(url, AUTH_HEADER)
#     end 
# end