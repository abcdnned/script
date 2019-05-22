#!/bin/bash
DECODE='
<?xml version="1.0" encoding="UTF-8"  ?>

<decode version="2.0">
    <property>
        <recordCode>
            <field>SrcIp</field>
            <field>DestIp</field>
            <field>SrcPort</field>
            <field>DestPort</field>
            <field>PktId</field>
            <field>RRA</field>
        </recordCode>
    </property>

    <group decodeId="1">
        <property>
            <payloadCompleteRequired>true</payloadCompleteRequired>
        </property>
        <protocol baseProtocol="tcp" id="http">
            <recordField template="name" allItem="true">
                <field item="BUSICODE">BUSICODE</field>
            </recordField>
        </protocol>
        <protocol baseProtocol="http" id="xml">
            <recordField template="xpath" allItem="true">
                <field item="/AICRMSERVICE/PUBINFO/ORGID">ORGID</field>
            
                <field item="/AICRMSERVICE/PUBINFO/SYSOPID">SYSOPID</field>
            
                <field item="/AICRMSERVICE/PUBINFO/OPCODE">OPCODE</field>
            
                <field item="/AICRMSERVICE/PUBINFO/OPID">OPID</field>
            
                <field item="/AICRMSERVICE/PUBINFO/REGIONCODE">REGIONCODE</field>
            
                <field item="/AICRMSERVICE/PUBINFO/OSBSERIALNO">OSBSERIALNO</field>
            
                <field item="/AICRMSERVICE/PUBINFO/CLIENT_IP">CLIENT_IP</field>
            
                <field item="/AICRMSERVICE/PUBINFO/MAC_ADDRESS">MAC_ADDRESS</field>
            
                <field item="/AICRMSERVICE/PUBINFO/ACTCHNLTYPE">ACTCHNLTYPE</field>
            
                <field item="/AICRMSERVICE/RESPONSE/ERRORINFO/CODE">RET_CODE</field>
            
                <field item="/AICRMSERVICE/RESPONSE/ERRORINFO/MESSAGE">RET_MSG</field>
            
                <field item="/AICRMSERVICE/REQUEST/BUSIPARAMS/BILL_ID">BILL_ID</field>
            
                <field item="/AICRMSERVICE/REQUEST/BUSIPARAMS/ACCT_ID">ACCT_ID</field>
            </recordField>

            <property>
                <attribute key="acceptEncodingError" value="true" type="Boolean"></attribute>
            
                <attribute key="forceCharset" value="utf-8" type="string"></attribute>
            </property>
        </protocol>
    </group>
</decode>
'
MONITOR='
<?xml version="1.0" encoding="UTF-8"?>

<monitor version="3.3">
    <property>
        <!-- monitor file status every milliseconds of this-value Set this-value
            = O to disable this feature. Default is 60000 milliseconds. -->
        <monitorScanTickMilli>3000</monitorScanTickMilli>

        <!-- Parse time threshold for each file, unit is second. Set this-value=0
            to disable this feature. Default is 60000 milliseconds. -->
        <parseTimeAlertThreshold>60000</parseTimeAlertThreshold>
    </property>

    <group streamId="1">
        <fileSet folder="/home/tom/tmp/pcap_cache" order="name">*.pcap*</fileSet>
        <postAction folder="/home/tom/tmp/monitor_output">move</postAction>
        <property>
            <flowHashIncludeVlanEnable>true</flowHashIncludeVlanEnable>
            <timeOutOfOrderCheckEnable>true</timeOutOfOrderCheckEnable>
            <flowHashIncludeGreKeyEnable>false</flowHashIncludeGreKeyEnable>
            <stripGreEnable>false</stripGreEnable>
            <stripVxlanEnable>false</stripVxlanEnable>
            <ipReassembleEnable>false</ipReassembleEnable>
            <dropNoneGrePacketEnable>false</dropNoneGrePacketEnable>
        </property>
    </group>
</monitor>
'

create.sh . btr.decode.xml "$DECODE"
create.sh . monitor.xml "$MONITOR"
