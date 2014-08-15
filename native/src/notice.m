#import <Foundation/Foundation.h>

NSString* nsString(char* str) {
  if (!str)
    return nil;
  return [NSString stringWithCString:str encoding:NSUTF8StringEncoding];
}

void scheduleNotification(NSString* title, NSString* subTitle, NSString* message, NSString* sound) {
  NSUserNotification *notification = [NSUserNotification new];
  notification.title = title;
  notification.subtitle = subTitle;
  notification.informativeText = message;
  notification.soundName = (sound)? sound: NSUserNotificationDefaultSoundName;

  NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
  [center scheduleNotification:notification];
}

void send(char *title, char *subTitle, char *message, char *sound) {
  scheduleNotification(nsString(title),
		       nsString(subTitle),
		       nsString(message),
		       nsString(sound));
}
