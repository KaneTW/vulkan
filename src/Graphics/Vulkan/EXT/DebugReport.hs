{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE Strict #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Graphics.Vulkan.EXT.DebugReport where

import Text.Read.Lex( Lexeme(Ident)
                    )
import GHC.Read( expectP
               , choose
               )
import System.IO.Unsafe( unsafePerformIO
                       )
import Data.Word( Word32
                , Word64
                )
import Foreign.Ptr( Ptr
                  , plusPtr
                  , FunPtr
                  , castFunPtr
                  )
import Data.Int( Int32
               )
import Data.Bits( Bits
                , FiniteBits
                )
import Foreign.Storable( Storable(..)
                       )
import Data.Void( Void
                )
import Graphics.Vulkan.Memory( VkSystemAllocationScope(..)
                             , PFN_vkAllocationFunction
                             , PFN_vkReallocationFunction
                             , PFN_vkFreeFunction
                             , PFN_vkInternalAllocationNotification
                             , VkAllocationCallbacks(..)
                             , VkInternalAllocationType(..)
                             , PFN_vkInternalFreeNotification
                             )
import Text.Read( Read(..)
                , parens
                )
import Text.ParserCombinators.ReadPrec( (+++)
                                      , step
                                      , prec
                                      )
import Graphics.Vulkan.OtherTypes( VkObjectType(..)
                                 )
import Graphics.Vulkan.DeviceInitialization( vkGetInstanceProcAddr
                                           , VkInstance(..)
                                           )
import Foreign.C.String( withCString
                       )
import Graphics.Vulkan.Core( VkBool32(..)
                           , VkFlags(..)
                           , VkStructureType(..)
                           , VkResult(..)
                           )
import Foreign.C.Types( CSize
                      , CChar
                      , CSize(..)
                      )

pattern VK_EXT_DEBUG_REPORT_EXTENSION_NAME =  "VK_EXT_debug_report"
-- ** vkDebugReportMessageEXT
foreign import ccall "dynamic" mkvkDebugReportMessageEXT :: FunPtr (VkInstance ->
  VkDebugReportFlagsEXT ->
    VkDebugReportObjectTypeEXT ->
      Word64 -> CSize -> Int32 -> Ptr CChar -> Ptr CChar -> IO ()) -> (VkInstance ->
  VkDebugReportFlagsEXT ->
    VkDebugReportObjectTypeEXT ->
      Word64 -> CSize -> Int32 -> Ptr CChar -> Ptr CChar -> IO ())
vkDebugReportMessageEXT :: VkInstance ->
  VkDebugReportFlagsEXT ->
    VkDebugReportObjectTypeEXT ->
      Word64 -> CSize -> Int32 -> Ptr CChar -> Ptr CChar -> IO ()
vkDebugReportMessageEXT i = (mkvkDebugReportMessageEXT $ castFunPtr $ procAddr) i
  where procAddr = unsafePerformIO $ withCString "vkDebugReportMessageEXT" $ vkGetInstanceProcAddr i
newtype VkDebugReportCallbackEXT = VkDebugReportCallbackEXT Word64
  deriving (Eq, Ord, Storable, Show)
pattern VK_EXT_DEBUG_REPORT_SPEC_VERSION =  0x9
-- ** VkDebugReportObjectTypeEXT
newtype VkDebugReportObjectTypeEXT = VkDebugReportObjectTypeEXT Int32
  deriving (Eq, Ord, Storable)

instance Show VkDebugReportObjectTypeEXT where
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT"
  showsPrec p (VkDebugReportObjectTypeEXT x) = showParen (p >= 11) (showString "VkDebugReportObjectTypeEXT " . showsPrec 11 x)

instance Read VkDebugReportObjectTypeEXT where
  readPrec = parens ( choose [ ("VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkDebugReportObjectTypeEXT")
                        v <- step readPrec
                        pure (VkDebugReportObjectTypeEXT v)
                        )
                    )

pattern VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = VkDebugReportObjectTypeEXT 0

pattern VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = VkDebugReportObjectTypeEXT 1

pattern VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = VkDebugReportObjectTypeEXT 2

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = VkDebugReportObjectTypeEXT 3

pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = VkDebugReportObjectTypeEXT 4

pattern VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = VkDebugReportObjectTypeEXT 5

pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = VkDebugReportObjectTypeEXT 6

pattern VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = VkDebugReportObjectTypeEXT 7

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = VkDebugReportObjectTypeEXT 8

pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = VkDebugReportObjectTypeEXT 9

pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = VkDebugReportObjectTypeEXT 10

pattern VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = VkDebugReportObjectTypeEXT 11

pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = VkDebugReportObjectTypeEXT 12

pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = VkDebugReportObjectTypeEXT 13

pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = VkDebugReportObjectTypeEXT 14

pattern VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = VkDebugReportObjectTypeEXT 15

pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = VkDebugReportObjectTypeEXT 16

pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = VkDebugReportObjectTypeEXT 17

pattern VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = VkDebugReportObjectTypeEXT 18

pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = VkDebugReportObjectTypeEXT 19

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = VkDebugReportObjectTypeEXT 20

pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = VkDebugReportObjectTypeEXT 21

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = VkDebugReportObjectTypeEXT 22

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = VkDebugReportObjectTypeEXT 23

pattern VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = VkDebugReportObjectTypeEXT 24

pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = VkDebugReportObjectTypeEXT 25

pattern VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = VkDebugReportObjectTypeEXT 26

pattern VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = VkDebugReportObjectTypeEXT 27

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = VkDebugReportObjectTypeEXT 28

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = VkDebugReportObjectTypeEXT 29

pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = VkDebugReportObjectTypeEXT 30

pattern VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT = VkDebugReportObjectTypeEXT 31

pattern VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT = VkDebugReportObjectTypeEXT 32

pattern VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT = VkDebugReportObjectTypeEXT 33

data VkDebugReportCallbackCreateInfoEXT =
  VkDebugReportCallbackCreateInfoEXT{ vkSType :: VkStructureType 
                                    , vkPNext :: Ptr Void 
                                    , vkFlags :: VkDebugReportFlagsEXT 
                                    , vkPfnCallback :: PFN_vkDebugReportCallbackEXT 
                                    , vkPUserData :: Ptr Void 
                                    }
  deriving (Eq, Ord, Show)
instance Storable VkDebugReportCallbackCreateInfoEXT where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkDebugReportCallbackCreateInfoEXT <$> peek (ptr `plusPtr` 0)
                                                <*> peek (ptr `plusPtr` 8)
                                                <*> peek (ptr `plusPtr` 16)
                                                <*> peek (ptr `plusPtr` 24)
                                                <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 24) (vkPfnCallback (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 32) (vkPUserData (poked :: VkDebugReportCallbackCreateInfoEXT))
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT =  0x3b9af4f8
-- ** vkDestroyDebugReportCallbackEXT
foreign import ccall "dynamic" mkvkDestroyDebugReportCallbackEXT :: FunPtr (VkInstance ->
  VkDebugReportCallbackEXT -> Ptr VkAllocationCallbacks -> IO ()) -> (VkInstance ->
  VkDebugReportCallbackEXT -> Ptr VkAllocationCallbacks -> IO ())
vkDestroyDebugReportCallbackEXT :: VkInstance ->
  VkDebugReportCallbackEXT -> Ptr VkAllocationCallbacks -> IO ()
vkDestroyDebugReportCallbackEXT i = (mkvkDestroyDebugReportCallbackEXT $ castFunPtr $ procAddr) i
  where procAddr = unsafePerformIO $ withCString "vkDestroyDebugReportCallbackEXT" $ vkGetInstanceProcAddr i
-- ** VkDebugReportFlagsEXT
newtype VkDebugReportFlagBitsEXT = VkDebugReportFlagBitsEXT VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits)

-- | Alias for VkDebugReportFlagBitsEXT
type VkDebugReportFlagsEXT = VkDebugReportFlagBitsEXT

instance Show VkDebugReportFlagBitsEXT where
  showsPrec _ VK_DEBUG_REPORT_INFORMATION_BIT_EXT = showString "VK_DEBUG_REPORT_INFORMATION_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_WARNING_BIT_EXT = showString "VK_DEBUG_REPORT_WARNING_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = showString "VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_ERROR_BIT_EXT = showString "VK_DEBUG_REPORT_ERROR_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_DEBUG_BIT_EXT = showString "VK_DEBUG_REPORT_DEBUG_BIT_EXT"
  
  showsPrec p (VkDebugReportFlagBitsEXT x) = showParen (p >= 11) (showString "VkDebugReportFlagBitsEXT " . showsPrec 11 x)

instance Read VkDebugReportFlagBitsEXT where
  readPrec = parens ( choose [ ("VK_DEBUG_REPORT_INFORMATION_BIT_EXT", pure VK_DEBUG_REPORT_INFORMATION_BIT_EXT)
                             , ("VK_DEBUG_REPORT_WARNING_BIT_EXT", pure VK_DEBUG_REPORT_WARNING_BIT_EXT)
                             , ("VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT", pure VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT)
                             , ("VK_DEBUG_REPORT_ERROR_BIT_EXT", pure VK_DEBUG_REPORT_ERROR_BIT_EXT)
                             , ("VK_DEBUG_REPORT_DEBUG_BIT_EXT", pure VK_DEBUG_REPORT_DEBUG_BIT_EXT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkDebugReportFlagBitsEXT")
                        v <- step readPrec
                        pure (VkDebugReportFlagBitsEXT v)
                        )
                    )

pattern VK_DEBUG_REPORT_INFORMATION_BIT_EXT = VkDebugReportFlagBitsEXT 0x1

pattern VK_DEBUG_REPORT_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT 0x2

pattern VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT 0x4

pattern VK_DEBUG_REPORT_ERROR_BIT_EXT = VkDebugReportFlagBitsEXT 0x8

pattern VK_DEBUG_REPORT_DEBUG_BIT_EXT = VkDebugReportFlagBitsEXT 0x10
type PFN_vkDebugReportCallbackEXT = FunPtr
  (VkDebugReportFlagsEXT ->
     VkDebugReportObjectTypeEXT ->
       Word64 ->
         CSize ->
           Int32 -> Ptr CChar -> Ptr CChar -> Ptr Void -> IO VkBool32)
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = VkStructureType 1000011000
pattern VK_ERROR_VALIDATION_FAILED_EXT = VkResult (-1000011001)
pattern VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT = VkObjectType 1000011000
-- ** vkCreateDebugReportCallbackEXT
foreign import ccall "dynamic" mkvkCreateDebugReportCallbackEXT :: FunPtr (VkInstance ->
  Ptr VkDebugReportCallbackCreateInfoEXT ->
    Ptr VkAllocationCallbacks ->
      Ptr VkDebugReportCallbackEXT -> IO VkResult) -> (VkInstance ->
  Ptr VkDebugReportCallbackCreateInfoEXT ->
    Ptr VkAllocationCallbacks ->
      Ptr VkDebugReportCallbackEXT -> IO VkResult)
vkCreateDebugReportCallbackEXT :: VkInstance ->
  Ptr VkDebugReportCallbackCreateInfoEXT ->
    Ptr VkAllocationCallbacks ->
      Ptr VkDebugReportCallbackEXT -> IO VkResult
vkCreateDebugReportCallbackEXT i = (mkvkCreateDebugReportCallbackEXT $ castFunPtr $ procAddr) i
  where procAddr = unsafePerformIO $ withCString "vkCreateDebugReportCallbackEXT" $ vkGetInstanceProcAddr i
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT =  0x1c
