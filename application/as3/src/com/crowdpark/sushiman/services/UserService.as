package com.crowdpark.sushiman.services
{
	import com.crowdpark.core.abstracts.AbstractService;
	import com.crowdpark.core.rpc.JsonRpcClient;
	import com.crowdpark.core.rpc.JsonRpcClientEvent;
	import com.crowdpark.sushiman.model.user.UserAppFriendsModel;
	import com.crowdpark.sushiman.model.user.UserVo;

	/**
	 * @author francis
	 */
	public class UserService extends AbstractService implements IUserService
	{
		
		[Inject]
		public var userVo : UserVo;
		
		[Inject]
		public var userAppFriendsModel : UserAppFriendsModel;
		
		public function getInitialData() : void
		{
			var client : JsonRpcClient = new JsonRpcClient();
			client.url = this.gatewayUrl;
			client.method = "App.User.getInitialData";
			client.addEventListener(JsonRpcClientEvent.RESULT, onGetInitialDataComplete);
			client.send();
		}

		private function onGetInitialDataComplete(event : JsonRpcClientEvent) : void
		{
			var appFriendsList : Array = event.dataProvider['appFriendsList'];
			var userRawData : Object = event.dataProvider['user'];
			var friendsIdList : Array = event.dataProvider['friendsIdList'];
			
			userVo.firstName = userRawData['firstName'];
			userVo.lastName = userRawData['lastName'];
			userVo.score = userRawData['score'];
		}

		override protected function get gatewayUrl() : String
		{
			return "http://api_shushiman.crowdpark-game.com/api/v1/app/";
		}
	}
}
