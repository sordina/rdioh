{-# LANGUAGE OverloadedStrings #-}

{-
IDEA: all of these modles could have been split up into their own modules:
Rdioh.Model.Artist etc etc.
Then we wouldn't have these scoping issues and all the fields could be normal names.

Downside: user has to import each module explicitly to use it.
-}

module Rdioh.Models where
import Data.Aeson
import Control.Applicative

data AlbumExtra = AlbumIframeUrl | AlbumIsCompilation | AlbumLabel | AlbumBigIcon | AlbumReleaseDateISO

instance Show AlbumExtra where
    show AlbumIframeUrl = "iframeUrl"
    show AlbumIsCompilation = "isCompilation"
    show AlbumLabel = "label"
    show AlbumBigIcon = "bigIcon"
    show AlbumReleaseDateISO = "releaseDateISO"

data Album = Album {
               albumName :: String,
               albumIcon :: String,
               albumBaseIcon :: String,
               albumUrl :: String,
               albumArtist :: String,
               albumArtistUrl :: String,
               isExplicit :: Bool,
               isClean :: Bool,
               albumLength :: Int,
               albumArtistKey :: String,
               trackKeys :: [String],
               price :: String,
               canStream :: Bool,
               canSample :: Bool,
               canTether :: Bool,
               albumShortUrl :: String,
               embedUrl :: String,
               displayDate :: String,
               albumKey :: String,
               releaseDate :: String,
               duration :: Int,
               iframeUrl :: Maybe String,
               isCompilation :: Maybe Bool,
               albumLabel :: Maybe String,
               albumBigIcon :: Maybe String,
               releaseDateISO :: Maybe String
} deriving (Show)

instance FromJSON Album where
  parseJSON (Object v) = Album <$> v .: "name"
                               <*> v .: "icon"
                               <*> v .: "baseIcon"
                               <*> v .: "url"
                               <*> v .: "artist"
                               <*> v .: "artistUrl"
                               <*> v .: "isExplicit"
                               <*> v .: "isClean"
                               <*> v .: "length"
                               <*> v .: "artistKey"
                               <*> v .: "trackKeys"
                               <*> v .: "price"
                               <*> v .: "canStream"
                               <*> v .: "canSample"
                               <*> v .: "canTether"
                               <*> v .: "shortUrl"
                               <*> v .: "embedUrl"
                               <*> v .: "displayDate"
                               <*> v .: "key"
                               <*> v .: "releaseDate"
                               <*> v .: "duration"
                               <*> v .:? "iframeUrl"
                               <*> v .:? "isCompilation"
                               <*> v .:? "label"
                               <*> v .:? "bigIcon"
                               <*> v .:? "releaseDateISO"

data ArtistExtra = ArtistAlbumCount

instance Show ArtistExtra where
    show ArtistAlbumCount = "albumCount"

data Artist = Artist {
            artistName :: String,
            artistKey :: String,
            artistUrl :: String,
            artistLength :: Int,
            artistIcon :: String,
            artistBaseIcon :: String,
            hasRadio :: Bool,
            artistShortUrl :: String,
            radioKey :: Maybe String,
            topSongsKey :: Maybe String,
            artistAlbumCount :: Maybe Int
} deriving (Show)

instance FromJSON Artist where
  parseJSON (Object v) = Artist <$> v .: "name"
                                <*> v .: "key"
                                <*> v .: "url"
                                <*> v .: "length"
                                <*> v .: "icon"
                                <*> v .: "baseIcon"
                                <*> v .: "hasRadio"
                                <*> v .: "shortUrl"
                                <*> v .:? "radioKey"
                                <*> v .:? "topSongsKey"
                                <*> v .:? "albumCount"

data Label = Label {
           labelName :: String,
           labelKey :: String,
           labelUrl :: String,
           labelShortUrl :: String,
           labelHasRadio :: Bool,
           labelRadioKey :: String
} deriving (Show)

instance FromJSON Label where
  parseJSON (Object v) = Label <$> v .: "name"
                               <*> v .: "key"
                               <*> v .: "url"
                               <*> v .: "shortUrl"
                               <*> v .: "hasRadio"
                               <*> v .: "radioKey"

data TrackExtra = IsInCollection | IsOnCompilation | Isrcs | TrackIframeUrl | PlayCount | TrackBigIcon

instance Show TrackExtra where
    show IsInCollection = "isInCollection"
    show IsOnCompilation = "isOnCompilation"
    show Isrcs = "isrcs"
    show TrackIframeUrl = "iframeUrl"
    show PlayCount = "playCount"
    show TrackBigIcon = "bigIcon"

data Track = Track {
           trackName :: String,
           trackArtist :: String,
           trackAlbum :: String,
           trackAlbumKey :: String,
           trackAlbumUrl :: String,
           trackArtistKey :: String,
           trackArtistUrl :: String,
           trackDuration :: Int,
           trackIsExplicit :: Bool,
           trackIsClean :: Bool,
           trackUrl :: String,
           trackBaseIcon :: String,
           trackCanDownload :: Bool,
           trackCanDownloadAlbumOnly :: Bool,
           trackCanStream :: Bool,
           trackCanTether :: Bool,
           trackCanSample :: Bool,
           trackPrice :: String,
           trackEmbedUrl :: String,
           trackKey :: String,
           trackIcon :: String,
           trackNum :: Int,
           trackAlbumArtist :: Maybe String,
           trackAlbumArtistKey :: Maybe String,
           isInCollection :: Maybe Bool,
           isOnCompilation :: Maybe Bool,
           isrcs :: Maybe [String],
           trackIframeUrl :: Maybe String,
           playCount :: Maybe Int,
           trackBigIcon :: Maybe String
} deriving (Show)

instance FromJSON Track where
  parseJSON (Object v) = Track <$> v .: "name"
                               <*> v .: "artist"
                               <*> v .: "album"
                               <*> v .: "albumKey"
                               <*> v .: "albumUrl"
                               <*> v .: "artistKey"
                               <*> v .: "artistUrl"
                               <*> v .: "duration"
                               <*> v .: "isExplicit"
                               <*> v .: "isClean"
                               <*> v .: "url"
                               <*> v .: "baseIcon"
                               <*> v .: "canDownload"
                               <*> v .: "canDownloadAlbumOnly"
                               <*> v .: "canStream"
                               <*> v .: "canTether"
                               <*> v .: "canSample"
                               <*> v .: "price"
                               <*> v .: "embedUrl"
                               <*> v .: "key"
                               <*> v .: "icon"
                               <*> v .: "trackNum"
                               <*> v .:? "albumArtist"
                               <*> v .:? "albumArtistKey"
                               <*> v .:? "isInCollection"
                               <*> v .:? "isOnCompilation"
                               <*> v .:? "isrcs"
                               <*> v .:? "iframeUrl"
                               <*> v .:? "playCount"
                               <*> v .:? "bigIcon"

data Reason = Viewable | UserPreference | OrderedAlbum | TooFewSongs deriving (Show)

instance FromJSON Reason where
  parseJSON (Number n)
      | n == 0 = return Viewable
      | n == 1 = return UserPreference
      | n == 2 = return OrderedAlbum
      | n == 3 = return TooFewSongs

data PlaylistExtra = PlIframeUrl | IsViewable | PlBigIcon | PlDescription | PlTracks | IsPublished | PlTrackKeys | ReasonNotViewable

instance Show PlaylistExtra where
    show PlIframeUrl = "iframeUrl"
    show IsViewable = "isViewable"
    show PlBigIcon = "bigIcon"
    show PlDescription = "description"
    show PlTracks = "tracks"
    show IsPublished = "isPublished"
    show PlTrackKeys = "trackKeys"
    show ReasonNotViewable = "reasonNotViewable"

data Playlist = Playlist {
              plName :: String,
              plUrl :: String,
              plOwner :: String,
              plOwnerUrl :: String,
              plOwnerKey :: String,
              plOwnerIcon :: String,
              plShortUrl :: String,
              plEmbedUrl :: String,
              plKey :: String,
              plLength :: Maybe Int,
              plIcon :: Maybe String,
              plBaseIcon :: Maybe String,
              lastUpdated :: Maybe Int,
              plIFrameUrl :: Maybe String,
              isViewable :: Maybe Bool,
              plBigIcon :: Maybe String,
              plDescription :: Maybe String,
              plTracks :: Maybe [Track],
              isPublished :: Maybe Bool,
              plTrackKeys :: Maybe [String],
              reasonNotViewable :: Maybe Reason
} deriving (Show)

instance FromJSON Playlist where
  parseJSON (Object v) = Playlist <$> v .: "name"
                                  <*> v .: "url"
                                  <*> v .: "owner"
                                  <*> v .: "ownerUrl"
                                  <*> v .: "ownerKey"
                                  <*> v .: "ownerIcon"
                                  <*> v .: "shortUrl"
                                  <*> v .: "embedUrl"
                                  <*> v .: "key"
                                  <*> v .:? "length"
                                  <*> v .:? "icon"
                                  <*> v .:? "baseIcon"
                                  <*> v .:? "lastUpdated"
                                  <*> v .:? "iframeUrl"
                                  <*> v .:? "isViewable"
                                  <*> v .:? "bigIcon"
                                  <*> v .:? "description"
                                  <*> v .:? "tracks"
                                  <*> v .:? "isPublished"
                                  <*> v .:? "trackKeys"
                                  <*> v .:? "reasonNotViewable"

data Gender = Male | Female deriving (Show)

data UserPlaylists = UserPlaylists {
                   upOwned :: [Playlist],
                   upCollab :: [Playlist],
                   upSubscribed :: [Playlist]
} deriving (Show)

instance FromJSON UserPlaylists where
  parseJSON (Object v) = UserPlaylists <$> v .: "owned"
                                       <*> v .: "collab"
                                       <*> v .: "subscribed"


instance FromJSON Gender where
  parseJSON (String s) = return (if s == "m" then Male else Female)

data User = User {
              userKey :: String,
              firstName :: String,
              lastName :: String,
              userIcon :: String,
              userBaseIcon :: String,
              libraryVersion :: Int,
              userUrl :: String,
              gender :: Gender,
              followingUrl :: Maybe String,
              isTrial :: Maybe Bool,
              artistCount :: Maybe Int,
              lastSongPlayed :: Maybe String,
              heavyRotationKey :: Maybe String,
              networkHeavyRotationKey :: Maybe String,
              albumCount :: Maybe Int,
              trackCount :: Maybe Int,
              lastSongPlayTime :: Maybe String,
              username :: Maybe String,
              reviewCount :: Maybe Int,
              collectionUrl :: Maybe String,
              playlistsUrl :: Maybe String,
              collectionKey :: Maybe String,
              followersUrl :: Maybe String,
              displayName :: Maybe String,
              isUnlimited :: Maybe Bool,
              isSubscriber :: Maybe Bool
} deriving (Show)

data UserExtra = FollowingUrl | IsTrial | ArtistCount | LastSongPlayed | HeavyRotationKey | NetworkHeavyRotationKey | AlbumCount | TrackCount | LastSongPlayTime | Username | ReviewCount | CollectionUrl | PlaylistsUrl | CollectionKey | FollowersUrl | DisplayName | IsUnlimited | IsSubscriber

instance Show UserExtra where
    show FollowingUrl = "followingUrl"
    show IsTrial = "isTrial"
    show ArtistCount = "artistCount"
    show LastSongPlayed = "lastSongPlayed"
    show HeavyRotationKey = "heavyRotationKey"
    show NetworkHeavyRotationKey = "networkHeavyRotationKey"
    show AlbumCount = "albumCount"
    show TrackCount = "trackCount"
    show LastSongPlayTime = "lastSongPlayTime"
    show Username = "username"
    show ReviewCount = "reviewCount"
    show CollectionUrl = "collectionUrl"
    show PlaylistsUrl = "playlistsUrl"
    show CollectionKey = "collectionkey"
    show FollowersUrl = "followersUrl"
    show DisplayName = "displayName"
    show IsUnlimited = "isUnlimited"
    show IsSubscriber = "isSubscriber"

instance FromJSON User where
  parseJSON (Object v) = User <$> v .: "key"
                              <*> v .: "firstName"
                              <*> v .: "lastName"
                              <*> v .: "icon"
                              <*> v .: "baseIcon"
                              <*> v .: "libraryVersion"
                              <*> v .: "url"
                              <*> v .: "gender"
                              <*> v .:? "followingUrl"
                              <*> v .:? "isTrial"
                              <*> v .:? "artistCount"
                              <*> v .:? "lastSongPlayed"
                              <*> v .:? "heavyRotationKey"
                              <*> v .:? "networkHeavyRotationKey"
                              <*> v .:? "albumCount"
                              <*> v .:? "trackCount"
                              <*> v .:? "lastSongPlayTime"
                              <*> v .:? "username"
                              <*> v .:? "reviewCount"
                              <*> v .:? "collectionUrl"
                              <*> v .:? "playlistsUrl"
                              <*> v .:? "collectionKey"
                              <*> v .:? "followersUrl"
                              <*> v .:? "displayName"
                              <*> v .:? "isUnlimited"
                              <*> v .:? "isSubscriber"

data CollectionAlbum = CollectionAlbum {
                          colName :: String,
                          colIcon :: String,
                          colBaseIcon :: String,
                          colUrl :: String,
                          colArtist :: String,
                          colAlbumArtistUrl :: String,
                          colIsExplicit :: Bool,
                          colIsClean :: Bool,
                          colLength :: Int,
                          colAlbumArtistKey :: String,
                          colTrackKeys :: [String],
                          colPrice :: String,
                          colCanStream :: Bool,
                          colCanSample :: Bool,
                          colCanTether :: Bool,
                          colShortUrl :: String,
                          colEmbedUrl :: String,
                          colDisplayDate :: String,
                          colKey :: String,
                          colReleaseDate :: String,
                          colDuration :: Int,
                          colUserKey :: String,
                          colUserName :: String,
                          colAlbumKey :: String,
                          colAlbumUrl :: String,
                          colCollectionUrl :: String,
                          colItemTrackKeys :: [String],
                          colIframeUrl :: Maybe String,
                          colUserGender :: Maybe Gender,
                          colIsCompilation :: Maybe Bool,
                          colLabel :: Maybe String,
                          colReleaseDateISO :: Maybe String,
                          colUpcs :: Maybe [String],
                          colBigIcon :: Maybe String
} deriving (Show)

instance FromJSON CollectionAlbum where
  parseJSON (Object v) = CollectionAlbum <$> v .: "name"
                                         <*> v .: "icon"
                                         <*> v .: "baseIcon"
                                         <*> v .: "url"
                                         <*> v .: "artist"
                                         <*> v .: "artistUrl"
                                         <*> v .: "isExplicit"
                                         <*> v .: "isClean"
                                         <*> v .: "length"
                                         <*> v .: "artistKey"
                                         <*> v .: "trackKeys"
                                         <*> v .: "price"
                                         <*> v .: "canStream"
                                         <*> v .: "canSample"
                                         <*> v .: "canTether"
                                         <*> v .: "shortUrl"
                                         <*> v .: "embedUrl"
                                         <*> v .: "displayDate"
                                         <*> v .: "key"
                                         <*> v .: "releaseDate"
                                         <*> v .: "duration"
                                         <*> v .: "userkey"
                                         <*> v .: "userName"
                                         <*> v .: "albumKey"
                                         <*> v .: "albumUrl"
                                         <*> v .: "collectionUrl"
                                         <*> v .: "itemTrackKeys"
                                         <*> v .:? "iframeUrl"
                                         <*> v .:? "userGender"
                                         <*> v .:? "isCompilation"
                                         <*> v .:? "label"
                                         <*> v .:? "releaseDateISO"
                                         <*> v .:? "upcs"
                                         <*> v .:? "bigIcon"

data CollectionArtist = CollectionArtist {
                          colArtistName :: String,
                          colArtistKey :: String,
                          colArtistUrl :: String,
                          colArtistLength :: Int,
                          colArtistIcon :: String,
                          colArtistBaseIcon :: String,
                          colArtistHasRadio :: Bool,
                          colArtistShortUrl :: String,
                          colArtistRadioKey :: String,
                          colArtistTopSongsKey :: [String],
                          colArtistUserKey :: String,
                          colArtistUserName :: String,
                          colArtistArtistKey :: String,
                          colArtistArtistUrl :: String,
                          colArtistCollectionUrl :: String,
                          colCount :: Maybe Int,
                          colAlbumCount :: Maybe Int
} deriving (Show)

instance FromJSON CollectionArtist where
  parseJSON (Object v) = CollectionArtist <$> v .: "name"
                                          <*> v .: "key"
                                          <*> v .: "url"
                                          <*> v .: "length"
                                          <*> v .: "icon"
                                          <*> v .: "baseIcon"
                                          <*> v .: "hasRadio"
                                          <*> v .: "shortUrl"
                                          <*> v .: "radioKey"
                                          <*> v .: "topSongsKey"
                                          <*> v .: "userKey"
                                          <*> v .: "userName"
                                          <*> v .: "artistKey"
                                          <*> v .: "artistUrl"
                                          <*> v .: "collectionUrl"
                                          <*> v .:? "count"
                                          <*> v .:? "albumCount"

data LabelStation = LabelStation {
                      lsCount :: Int,
                      lsLabelName :: String,
                      lsName :: String,
                      lsHasRadio :: Bool,
                      lsTracks :: [String],
                      lsLabelUrl :: String,
                      lsShortUrl :: String,
                      lsLength :: Int,
                      lsUrl :: String,
                      lsKey :: String,
                      lsRadioKey :: String,
                      lsReloadOnRepeat :: Bool,
                      lsTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON LabelStation where
  parseJSON (Object v) = LabelStation <$> v .: "count"
                                      <*> v .: "labelName"
                                      <*> v .: "name"
                                      <*> v .: "hasRadio"
                                      <*> v .: "tracks"
                                      <*> v .: "labelUrl"
                                      <*> v .: "shortUrl"
                                      <*> v .: "length"
                                      <*> v .: "url"
                                      <*> v .: "key"
                                      <*> v .: "radioKey"
                                      <*> v .: "reloadOnRepeat"
                                      <*> v .:? "trackKeys"

data ArtistStation = ArtistStation {
                       asRadioKey :: String,
                       asTopSongsKey :: String,
                       asBaseIcon :: String,
                       asTracks :: [String],
                       asArtistUrl :: String,
                       asKey :: String,
                       asReloadOnRepeat :: Bool,
                       asIcon :: String,
                       asCount :: Int,
                       asName :: String,
                       asHasRadio :: Bool,
                       asUrl :: String,
                       asArtistName :: String,
                       asShortUrl :: String,
                       asLength :: Int,
                       asAlbumCount :: Maybe Int,
                       asTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON ArtistStation where
  parseJSON (Object v) = ArtistStation <$> v .: "radioKey"
                                       <*> v .: "topSongsKey"
                                       <*> v .: "baseIcon"
                                       <*> v .: "tracks"
                                       <*> v .: "artistUrl"
                                       <*> v .: "key"
                                       <*> v .: "reloadOnRepeat"
                                       <*> v .: "icon"
                                       <*> v .: "count"
                                       <*> v .: "name"
                                       <*> v .: "hasRadio"
                                       <*> v .: "url"
                                       <*> v .: "artistName"
                                       <*> v .: "shortUrl"
                                       <*> v .: "length"
                                       <*> v .:? "albumCount"
                                       <*> v .:? "trackKeys"

data HeavyRotationStation = HeavyRotationStation {
                              hrsKey :: String,
                              hrsLength :: Int,
                              hrsTracks :: Int,
                              hrsReloadOnRepeat :: Bool,
                              hrsCount :: Int,
                              hrsUser :: String,
                              hrsBaseIcon :: String,
                              hrsIcon :: String,
                              hrsName :: String,
                              hrsTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON HeavyRotationStation where
  parseJSON (Object v) = HeavyRotationStation <$> v .: "key"
                                              <*> v .: "length"
                                              <*> v .: "tracks"
                                              <*> v .: "reloadOnRepeat"
                                              <*> v .: "count"
                                              <*> v .: "user"
                                              <*> v .: "baseIcon"
                                              <*> v .: "icon"
                                              <*> v .: "name"
                                              <*> v .:? "trackKeys"

data HeavyRotationUserStation = HeavyRotationUserStation {
                                  hrusKey :: String,
                                  hrusLength :: Int,
                                  hrusTracks :: Int,
                                  hrusReloadOnRepeat :: Bool,
                                  hrusCount :: Int,
                                  hrusUser :: String,
                                  hrusBaseIcon :: String,
                                  hrusIcon :: String,
                                  hrusName :: String,
                                  hrusTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON HeavyRotationUserStation where
  parseJSON (Object v) = HeavyRotationUserStation <$> v .: "key"
                                                  <*> v .: "length"
                                                  <*> v .: "tracks"
                                                  <*> v .: "reloadOnRepeat"
                                                  <*> v .: "count"
                                                  <*> v .: "user"
                                                  <*> v .: "baseIcon"
                                                  <*> v .: "icon"
                                                  <*> v .: "name"
                                                  <*> v .:? "trackKeys"

data ArtistTopSongsStation = ArtistTopSongsStation {
                               atssRadioKey :: String,
                               atssTopSongsKey :: String,
                               atssBaseIcon :: String,
                               atssTracks :: [String],
                               atssArtistUrl :: String,
                               atssKey :: String,
                               atssReloadOnRepeat :: Bool,
                               atssIcon :: String,
                               atssCount :: Int,
                               atssName :: String,
                               atssHasRadio :: Bool,
                               atssUrl :: String,
                               atssArtistName :: String,
                               atssShortUrl :: String,
                               atssLength :: Int,
                               atssAlbumCount :: Maybe Int,
                               atssTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON ArtistTopSongsStation where
  parseJSON (Object v) = ArtistTopSongsStation <$> v .: "radioKey"
                                               <*> v .: "topSongsKey"
                                               <*> v .: "baseIcon"
                                               <*> v .: "tracks"
                                               <*> v .: "artistUrl"
                                               <*> v .: "key"
                                               <*> v .: "reloadOnRepeat"
                                               <*> v .: "icon"
                                               <*> v .: "count"
                                               <*> v .: "name"
                                               <*> v .: "hasRadio"
                                               <*> v .: "url"
                                               <*> v .: "artistName"
                                               <*> v .: "shortUrl"
                                               <*> v .: "length"
                                               <*> v .:? "albumCount"
                                               <*> v .:? "trackKeys"

data UserCollectionStation = UserCollectionStation {
                               ucsKey :: String,
                               ucsLength :: Int,
                               ucsTracks :: [String],
                               ucsReloadOnRepeat :: Bool,
                               ucsCount :: Int,
                               ucsUser :: String,
                               ucsBaseIcon :: String,
                               ucsIcon :: String,
                               ucsName :: String,
                               ucsUrl :: String,
                               ucsTrackKeys :: Maybe [String]
} deriving (Show)

instance FromJSON UserCollectionStation where
  parseJSON (Object v) = UserCollectionStation <$> v .: "key"
                                               <*> v .: "length"
                                               <*> v .: "tracks"
                                               <*> v .: "reloadOnRepeat"
                                               <*> v .: "count"
                                               <*> v .: "user"
                                               <*> v .: "baseIcon"
                                               <*> v .: "icon"
                                               <*> v .: "name"
                                               <*> v .: "url"
                                               <*> v .:? "trackKeys"

data RdioResponse v = RdioResponse {
                      rdioStatus :: String,
                      rdioResult :: v
} deriving (Show)

instance FromJSON a => FromJSON (RdioResponse a) where
  parseJSON (Object v) = RdioResponse <$> v .: "status"
                                      <*> v .: "result"

data SearchResults v = SearchResults {
                      results :: [v]
} deriving (Show)

instance FromJSON a => FromJSON (SearchResults a) where
  parseJSON (Object v) = SearchResults <$> v .: "results"

data PlaylistType = Owned | Collab | Subscribed

instance Show PlaylistType where
    show Owned = "owned"
    show Collab = "collab"
    show Subscribed = "subscribed"

data CollaborationMode = NoCollaboration | CollaborationWithAll | CollaborationWithFollowed deriving (Show)

data Scope = UserScope | FriendScope | AllScope

instance Show Scope where
    show UserScope = "user"
    show FriendScope = "friends"
    show AllScope = "everyone"

data Activity = Activity {
                  activityUser :: User,
                  updates :: [Update]
} deriving (Show)

instance FromJSON Activity where
  parseJSON (Object v) = Activity <$> v .: "user"
                                  <*> v .: "updates"

data UpdateType = UTrackAddedToCollection | UTrackAddedToPlaylist | UFriendAdded | UUserJoined | UCommentOnTrack | UCommentOnAlbum | UCommentOnArtist | UCommentOnPlaylist | UTrackAddedViaMatchCollection | UUserSubscribed | UTrackSynced deriving (Show)

instance FromJSON UpdateType where
  parseJSON (Number n)
      | n == 0 = return UTrackAddedToCollection
      | n == 1 = return UTrackAddedToPlaylist
      | n == 3 = return UFriendAdded
      | n == 5 = return UUserJoined
      | n == 6 = return UCommentOnTrack
      | n == 7 = return UCommentOnAlbum
      | n == 8 = return UCommentOnArtist
      | n == 9 = return UCommentOnPlaylist
      | n == 10 = return UTrackAddedViaMatchCollection
      | n == 11 = return UUserSubscribed
      | n == 12 = return UTrackSynced
    
data Update = Update {
                owner :: User,
                date :: String,
                updateType :: UpdateType
} deriving (Show)

instance FromJSON Update where
  parseJSON (Object v) = Update <$> v .: "owner"
                                <*> v .: "date"
                                <*> v .: "update_type"

data Timeframe = ThisWeek | LastWeek | TwoWeeks

instance Show Timeframe where
    show ThisWeek = "thisweek"
    show LastWeek = "lastweek"
    show TwoWeeks = "twoweeks"
