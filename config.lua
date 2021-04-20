Config = {}

Config.ShowDistance = 20.0 

Config.Menu = {
	Name = 'Jobcenter',
	Pos = { x = -264.06985473633, y = -966.65649414063, z = 31.224195480347  },
	String = 'Press ~g~E~s~ to access the ~y~job center!',
}

Config.Jobs = {

  {category = 'Jobs without whitelist', jobs = {
    {name = 'Unemployed', job = 'unemployed'},
    {name = 'Farmer', job = 'farmer'},
    {name = 'Downtown Cab. Co.', job = 'taxi'},
    }
  },


}

Config.MapBlip = {
  Pos    	= { x = -264.06985473633, y = -966.65649414063, z = 31.224195480347 },
  Sprite  	= 407,
  Display	= 4,
  Scale  	= 1.2,
  Colour  	= 84,
  Name      = 'Info Center',
}

Config.Marker = {
    id          = 27,
    colour      = {r = 0, g = 191, b = 225, a = 100},
    isRotating  = false,
    radius      = 1.5,
}
