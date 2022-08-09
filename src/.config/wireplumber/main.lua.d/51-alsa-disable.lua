rule = {
	matches = {
		{
			{ "device.name", "equals", "alsa_card.usb-C_T12L4O_USB_PnP_Audio_Device_U2dc0z7ws53a79rn-00" },
		},
		{
			{ "device.name", "equals", "alsa_card.pci-0000_0c_00.4" },
		},
		{
			{ "device.name", "equals", "alsa_card.usb-USB3.0_HD_Audio_Capture_USB3.0_HD_Video_Capture_HU123450-00" },
		},
		{
			{ "device.name", "equals", "alsa_card.pci-0000_0a_00.1" },
		},
	},
	apply_properties = {
		["device.disabled"] = true,
	},
}

table.insert(alsa_monitor.rules, rule)
