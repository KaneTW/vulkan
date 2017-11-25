{-# LANGUAGE PatternSynonyms #-}
module Graphics.Vulkan.EXT.SwapchainColorspace where

import Graphics.Vulkan.KHR.Surface( VkColorSpaceKHR(..)
                                  )

pattern VK_COLOR_SPACE_DCI_P3_LINEAR_EXT = VkColorSpaceKHR 1000104003
pattern VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT = VkColorSpaceKHR 1000104011
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION =  0x3
pattern VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT = VkColorSpaceKHR 1000104004
pattern VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT = VkColorSpaceKHR 1000104002
pattern VK_COLOR_SPACE_BT709_LINEAR_EXT = VkColorSpaceKHR 1000104005
pattern VK_COLOR_SPACE_HDR10_HLG_EXT = VkColorSpaceKHR 1000104010
pattern VK_COLOR_SPACE_DOLBYVISION_EXT = VkColorSpaceKHR 1000104009
pattern VK_COLOR_SPACE_PASS_THROUGH_EXT = VkColorSpaceKHR 1000104013
pattern VK_COLOR_SPACE_BT2020_LINEAR_EXT = VkColorSpaceKHR 1000104007
pattern VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT = VkColorSpaceKHR 1000104014
pattern VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME =  "VK_EXT_swapchain_colorspace"
pattern VK_COLOR_SPACE_HDR10_ST2084_EXT = VkColorSpaceKHR 1000104008
pattern VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT = VkColorSpaceKHR 1000104012
pattern VK_COLOR_SPACE_BT709_NONLINEAR_EXT = VkColorSpaceKHR 1000104006
pattern VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT = VkColorSpaceKHR 1000104001
