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
		<Item Name="Control_Eje_Figura.ctl" Type="VI" URL="../Control_Eje_Figura.ctl"/>
		<Item Name="Control_Figura.ctl" Type="VI" URL="../Control_Figura.ctl"/>
		<Item Name="Control_Opciones.ctl" Type="VI" URL="../Control_Opciones.ctl"/>
		<Item Name="Control_Operacion.ctl" Type="VI" URL="../Control_Operacion.ctl"/>
		<Item Name="Control_Selector_Variable.ctl" Type="VI" URL="../Control_Selector_Variable.ctl"/>
		<Item Name="Convertir_Opcion(SubVI).vi" Type="VI" URL="../Convertir_Opcion(SubVI).vi"/>
		<Item Name="Detener_Eje.vi" Type="VI" URL="../Detener_Eje.vi">
			<Item Name="Stop Move" Type="IIO Function Block"/>
			<Item Name="Stop Move 1" Type="IIO Function Block"/>
			<Item Name="Stop Move 2" Type="IIO Function Block"/>
		</Item>
		<Item Name="Eje X" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{F60B2252-1B7A-4EA2-9B4A-9E2E2757759F}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Eje Y" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{91014032-E0DE-4330-B112-A14F674E2D8A}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Eje Z" Type="Motion Axis">
			<Property Name="axis.class:0" Type="Int">10551365</Property>
			<Property Name="axis.SMVersion" Type="Int">201310</Property>
			<Property Name="deviceID:0" Type="Int">0</Property>
			<Property Name="resource.type:0" Type="Int">10551297</Property>
			<Property Name="resourceID:0" Type="Str">{9B537357-C88B-422B-AEB7-0B803ACF0623}</Property>
			<Property Name="softmotionID:0" Type="Str">{C89C22D6-09D8-451c-B54B-BE98A931F881}</Property>
			<Property Name="vendorID:0" Type="Int">0</Property>
		</Item>
		<Item Name="Generador_Entorno(SubVi).vi" Type="VI" URL="../Generador_Entorno(SubVi).vi"/>
		<Item Name="Modificar_Arreglos(SubVi).vi" Type="VI" URL="../Modificar_Arreglos(SubVi).vi"/>
		<Item Name="Modificar_Entorno(SubVi).vi" Type="VI" URL="../Modificar_Entorno(SubVi).vi"/>
		<Item Name="Monitor.vi" Type="VI" URL="../Monitor.vi">
			<Item Name="Read" Type="IIO Function Block"/>
			<Item Name="Read 1" Type="IIO Function Block"/>
			<Item Name="Read 2" Type="IIO Function Block"/>
		</Item>
		<Item Name="Movimiento_Velocidad.vi" Type="VI" URL="../Movimiento_Velocidad.vi">
			<Item Name="Straight-Line Move" Type="IIO Function Block"/>
		</Item>
		<Item Name="Panel_General.vi" Type="VI" URL="../Panel_General.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="NI_3D Picture Control.lvlib" Type="Library" URL="/&lt;vilib&gt;/picture/3D Picture Control/NI_3D Picture Control.lvlib"/>
			</Item>
			<Item Name="Desplazamientos_vrl.vi" Type="VI" URL="../../../Modelos_2/Mundo/Desplazamientos_vrl.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
