FROM cidasdpdasartip.cr.usgs.gov:8447/aqcu/aqcu-base:latest

ENV repo_name=aqcu-maven-centralized
ENV artifact_id=aqcu-dv-hydro-report
ENV artifact_version=0.0.1

RUN ./pull-from-artifactory.sh ${repo_name} gov.usgs.aqcu ${artifact_id} ${artifact_version} app.jar

#Add Launch Script
ADD launch-app.sh launch-app.sh
RUN ["chmod", "+x", "launch-app.sh"]

#Default ENV Values
ENV serverPort=7502
ENV maxHeapSpace=300M
ENV javaToRServiceEndpoint=https://reporting-services.nwis.usgs.gov:7500/aqcu-java-to-r/
ENV aqcuReportsWebserviceUrl=http://reporting.nwis.usgs.gov/aqcu/timeseries-ws/
ENV aquariusServiceEndpoint=http://ts.nwis.usgs.gov
ENV aquariusServiceUser=apinwisra
ENV hystrixThreadTimeout=600000
ENV hystrixMaxQueueSize=200
ENV hystrixThreadPoolSize=10
ENV AQUARIUS_SERVICE_PASSWORD_PATH=/aquariusPassword.txt
ENV simsBaseUrl=http://sims.water.usgs.gov/SIMS/StationInfo.aspx
ENV waterdataBaseUrl=http://waterdata.usgs.gov/nwis/inventory/
ENV nwisRaServiceEndpoint=https://reporting.nwis.usgs.gov/service
ENV HEALTHY_RESPONSE_CONTAINS='{"status":{"code":"UP","description":""}'
