{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Graphics.Vulkan.KHR.Maintenance1 where

import Graphics.Vulkan.Device( VkDevice(..)
                             )
import System.IO.Unsafe( unsafePerformIO
                       )
import Data.Word( Word32
                , Word64
                )
import Foreign.Ptr( FunPtr
                  , castFunPtr
                  )
import Data.Bits( Bits
                , FiniteBits
                )
import Foreign.Storable( Storable(..)
                       )
import Graphics.Vulkan.CommandPool( VkCommandPool(..)
                                  )
import Data.Void( Void
                )
import Graphics.Vulkan.Image( VkImageCreateFlagBits(..)
                            )
import Graphics.Vulkan.DeviceInitialization( vkGetDeviceProcAddr
                                           , VkFormatFeatureFlagBits(..)
                                           )
import Foreign.C.String( withCString
                       )
import Graphics.Vulkan.Core( VkFlags(..)
                           , VkResult(..)
                           )

pattern VK_KHR_MAINTENANCE1_EXTENSION_NAME =  "VK_KHR_maintenance1"
pattern VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR = VkFormatFeatureFlagBits 0x8000
pattern VK_KHR_MAINTENANCE1_SPEC_VERSION =  0x1
pattern VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR = VkFormatFeatureFlagBits 0x4000
pattern VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR = VkImageCreateFlagBits 0x20
-- ** VkCommandPoolTrimFlagsKHR-- | Opaque flag
newtype VkCommandPoolTrimFlagsKHR = VkCommandPoolTrimFlagsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Show)
-- ** vkTrimCommandPoolKHR
foreign import ccall "dynamic" mkvkTrimCommandPoolKHR :: FunPtr (VkDevice -> VkCommandPool -> VkCommandPoolTrimFlagsKHR -> IO ()) -> (VkDevice -> VkCommandPool -> VkCommandPoolTrimFlagsKHR -> IO ())
vkTrimCommandPoolKHR :: VkDevice -> VkCommandPool -> VkCommandPoolTrimFlagsKHR -> IO ()
vkTrimCommandPoolKHR d = (mkvkTrimCommandPoolKHR $ castFunPtr $ procAddr) d
  where procAddr = unsafePerformIO $ withCString "vkTrimCommandPoolKHR" $ vkGetDeviceProcAddr d
pattern VK_ERROR_OUT_OF_POOL_MEMORY_KHR = VkResult (-1000069000)
