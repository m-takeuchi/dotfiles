function proxy_mac --description 'kuins proxy setting'
	## auto proxy setting relating to wifi
	set KUINS_PROXY 'http://proxy.kuins.net:8080'

	set WIFI (networksetup -getairportnetwork en0)
	if [ (echo $WIFI | grep -cie KUINS-Air -cie kuins -cie rgw) = 1 ]
		set -x http_proxy $KUINS_PROXY
		set -x https_proxy $KUINS_PROXY
		set -x HTTPS_PROXY $KUINS_PROXY
		set -x ftp_proxy $KUINS_PROXY
		set -x FTP_PROXY $KUINS_PROXY
		set -x proxy_rsync $KUINS_PROXY
		set -x rsync_proxy $KUINS_PROXY
		set -x RSYNC_PROXY $KUINS_PROXY
		set -x ALL_PROXY $KUINS_PROXY
	else
		set -x http_proxy ""
		set -x https_proxy ""
		set -x HTTPS_PROXY ""
		set -x ftp_proxy ""
		set -x FTP_PROXY ""
		set -x proxy_rsync ""
		set -x rsync_proxy ""
		set -x RSYNC_PROXY ""
		set -x ALL_PROXY ""
	end
end
