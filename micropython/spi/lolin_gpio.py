import machine

class Pin(machine.Pin):
	def __init__(self, index, *args, **kwargs):  
		super(Pin, self).__init__((16, 5, 4, 0, 2, 14, 12, 13, 15, 3, 1, 9, 10)[index], *args, **kwargs)

