<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Property Name="SMProvider.SMVersion" Type="Int">201310</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">true</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Coordinate Space 1" Type="Motion Coordinate Space">
			<Property Name="axes:0:0" Type="Str">Eje X</Property>
			<Property Name="axes:0:1" Type="Str">Eje Y</Property>
			<Property Name="axes:0:Size" Type="UInt">2</Property>
			<Property Name="resource.type:0" Type="Int">10551313</Property>
			<Property Name="resourceID:0" Type="Str">{2CA0348D-F88A-43B3-AAAE-4FF25C72B18B}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
		</Item>
		<Item Name="Eje X" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{F46CEA8A-A9CD-41E6-AF4B-BD6A312F03F9}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Eje Y" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{2A29060B-C43C-4B02-AF41-3120E8A94B39}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Luis.vi" Type="VI" URL="../Luis.vi">
			<Item Name="Read" Type="IIO Function Block"/>
			<Item Name="Read 1" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
		</Item>
		<Item Name="visualizacionejes - Copy.vi" Type="VI" URL="../visualizacionejes - Copy.vi">
			<Item Name="Arc Move" Type="IIO Function Block"/>
			<Item Name="Read" Type="IIO Function Block"/>
			<Item Name="Read 1" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
		</Item>
		<Item Name="visualizacionejes.vi" Type="VI" URL="../visualizacionejes.vi">
			<Item Name="Arc Move" Type="IIO Function Block"/>
			<Item Name="Read" Type="IIO Function Block"/>
			<Item Name="Read 1" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
