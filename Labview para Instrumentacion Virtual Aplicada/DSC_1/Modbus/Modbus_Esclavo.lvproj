<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Property Name="varPersistentID:{A49DF340-7CF3-40C7-853F-6494096FE1B4}" Type="Ref">/My Computer/Esclavo_lib.lvlib/300001</Property>
	<Property Name="varPersistentID:{DD69C79C-4782-412B-A1E2-C46221E39B16}" Type="Ref">/My Computer/Esclavo_lib.lvlib/000002</Property>
	<Property Name="varPersistentID:{E8130E69-65CB-4F4B-A8AA-08E8BCD285FB}" Type="Ref">/My Computer/Esclavo_lib.lvlib/000001</Property>
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
		<Item Name="Esclavo.vi" Type="VI" URL="../Esclavo.vi"/>
		<Item Name="Esclavo_lib.lvlib" Type="Library" URL="../Esclavo_lib.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
