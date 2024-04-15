const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'apis',
  password: 'root123',
  port: 5432,
});

const getVehicles = (request, response) => {
  const querySytx = `
    SELECT
        id,
        vehicle_type AS "vehicleType",
        name,
        type,
        category,
        model_year AS "modelYear",
        price,
        currency,
        location,
        TO_CHAR(posted_date, 'DD/MM/YYYY') AS "postedDate",
        posted_by AS "postedBy"
    FROM
        vehicles ORDER BY id ASC;
`;
    pool.query(querySytx, (error, results) => {
      if (error) {
        throw error
      }
      const formattedVehicles = results.rows.map(vehicle => ({
        id: vehicle.id,
        vehicleType: vehicle.vehicleType,
        name: vehicle.name,
        type: vehicle.type,
        category: vehicle.category,
        modelYear: vehicle.modelYear,
        price: vehicle.price,
        currency: vehicle.currency,
        location: vehicle.location,
        postedDate: vehicle.postedDate,
        postedBy: vehicle.postedBy
    }));
      console.log('inside db', formattedVehicles);
      return response.status(200).json(formattedVehicles)
    })
  }

  const getVehiclesById = (request, response) => {
    const id = parseInt(request.params.id)
    const motorDetailsQuery = `
      SELECT 
        id,
        vehicle_type AS "vehicleType",
        name,
        type AS "type",
        category,
        model_year AS "modelYear",
        price,
        currency,
        location,
        posted_date AS "postedDate",
        posted_by AS "postedBy",
        trim,
        region_specs AS "regionSpecs",
        doors,
        body_type AS "bodyType",
        fuel_type AS "fuelType",
        seller_type AS "sellerType",
        transmission_type AS "transmissionType",
        horsepower,
        cylinders_no AS "cylindersNo",
        warranty,
        exterior_color AS "exteriorColor",
        interior_color AS "interiorColor",
        market
      FROM vehicles
      WHERE id = $1
      GROUP BY id;
    `;
    pool.query(motorDetailsQuery, [id], (error, results) => {
      if (error) {
        throw error
      }
      console.log("inside id selector", id);
      return response.status(200).json(results.rows)
    })
  }

  const getShowrooms = (request, response) => {
    const showroomQuery = `
            SELECT
                id,
                name,
                distance,
                distance_unit AS "distanceUnit",
                opening_hours AS "openingHours",
                manager_name AS "managerName"
            FROM
                showrooms ORDER BY id ASC;
        `;
    pool.query(showroomQuery, (error, results) => {
      if (error) {
        throw error
      }
      console.log('inside showrooms', results.rows);
      return response.status(200).json(results.rows)
    })
  }

  module.exports = {
    getVehicles,
    getVehiclesById,
    getShowrooms
  }