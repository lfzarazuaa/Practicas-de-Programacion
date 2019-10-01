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
		<Item Name="Control_Tipo.ctl" Type="VI" URL="../Control_Tipo.ctl"/>
		<Item Name="Coordinate Space 1" Type="Motion Coordinate Space">
			<Property Name="axes:0:0" Type="Str">EJE Y</Property>
			<Property Name="axes:0:1" Type="Str">EJE X</Property>
			<Property Name="axes:0:Size" Type="UInt">2</Property>
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551313</Property>
			<Property Name="resourceID:0" Type="Str">{39BCCB55-6597-41E1-B525-40FB058DA77F}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
		</Item>
		<Item Name="EJE X" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{3190ECAA-1A90-4914-A8D0-0530D26ADAE8}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="EJE Y" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{50953A8A-04FB-499C-A97A-50E433A67D65}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="EJE Z" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{77C4DFAB-ED02-4B16-A703-31270B0632D4}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Lineas.vi" Type="VI" URL="../Lineas.vi"/>
		<Item Name="Movimiento_1Eje(SubVi).vi" Type="VI" URL="../Movimiento_1Eje(SubVi).vi">
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
		</Item>
		<Item Name="Movimiento_2Ejes(SubVi).vi" Type="VI" URL="../Movimiento_2Ejes(SubVi).vi">
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 2" Type="IIO Function Block"/>
		</Item>
		<Item Name="Movimiento_3Ejes(SubVi).vi" Type="VI" URL="../Movimiento_3Ejes(SubVi).vi">
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 2" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 3" Type="IIO Function Block"/>
		</Item>
		<Item Name="Prueba_Entorno.vi" Type="VI" URL="../Prueba_Entorno.vi"/>
		<Item Name="Sistema.vi" Type="VI" URL="../Sistema.vi">
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 1" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 2" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 3" Type="IIO Function Block"/>
		</Item>
		<Item Name="Sistema_2.vi" Type="VI" URL="../Sistema_2.vi">
			<Item Name="Arc Move" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 1" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 2" Type="IIO Function Block"/>
			<Item Name="Straight-Line Move 3" Type="IIO Function Block"/>
		</Item>
		<Item Name="Sistema_3_Ejes.vi" Type="VI" URL="../Sistema_3_Ejes.vi"/>
		<Item Name="Sistema_3_Ejes_Estrella.vi" Type="VI" URL="../Sistema_3_Ejes_Estrella.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="NI_3D Picture Control.lvlib" Type="Library" URL="/&lt;vilib&gt;/picture/3D Picture Control/NI_3D Picture Control.lvlib"/>
			</Item>
			<Item Name="Desplazamientos_vrl.vi" Type="VI" URL="../../../Modelos_2/Mundo/Desplazamientos_vrl.vi"/>
			<Item Name="Entorno_Constante(SubVi).vi" Type="VI" URL="../Entorno_Constante(SubVi).vi"/>
			<Item Name="Generador_Entorno_2(SubVi).vi" Type="VI" URL="../Generador_Entorno_2(SubVi).vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
