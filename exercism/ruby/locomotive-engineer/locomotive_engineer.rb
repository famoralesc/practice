class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons  
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    wagon_1, wagon_2, locomotive, *rest = each_wagons_id
    new_list_of_wagons = locomotive, *missing_wagons, *rest, wagon_1, wagon_2
    new_list_of_wagons
  end

  def self.add_missing_stops(route, **stops)
    stops_values = stops.values
    {**route, stops: stops_values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end