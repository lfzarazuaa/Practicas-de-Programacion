<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Property Name="varPersistentID:{5440B987-E012-43C7-8728-5C2CEC96723C}" Type="Ref">/My Computer/Maestro_lib.lvlib/000002</Property>
	<Property Name="varPersistentID:{AEBAF60F-C47D-4F61-B701-C9D4812B04C2}" Type="Ref">/My Computer/Maestro_lib.lvlib/300001</Property>
	<Property Name="varPersistentID:{C6EAE9F0-EB75-45EE-8FB6-7A3170648C6D}" Type="Ref">/My Computer/Maestro_lib.lvlib/000001</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Maestro.vi" Type="VI" URL="../Maestro.vi"/>
		<Item Name="Maestro_lib.lvlib" Type="Library" URL="../Maestro_lib.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
