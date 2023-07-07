#pragma once

#include "Subsystems/WorldSubsystem.h"
#include "MikanClientTypes.h"
#include "MikanWorldSubsystem.generated.h"

DECLARE_DYNAMIC_MULTICAST_DELEGATE(FMikanWorldEvent);
DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FMikanMessageEvent, const FString&, Message);

UCLASS(HideCategories = (Navigation, Rendering, Physics, Collision, Cooking, Input, Actor))
class MIKANXR_API UMikanWorldSubsystem : public UWorldSubsystem
{
	GENERATED_BODY()

public:
	UMikanWorldSubsystem();

	static UMikanWorldSubsystem* GetInstance(class UWorld* CurrentWorld);

	virtual bool DoesSupportWorldType(EWorldType::Type WorldType) const override;
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
	virtual void Deinitialize() override;

	void BindMikanScene(class AMikanScene* InScene);
	void UnbindMikanScene(class AMikanScene* InScene);

	void HandleMikanEvent(MikanEvent* event);

	UPROPERTY(BlueprintAssignable)
	FMikanWorldEvent OnMikanConnected;

	UPROPERTY(BlueprintAssignable)
	FMikanWorldEvent OnMikanDisconnected;

	UPROPERTY(BlueprintAssignable)
	FMikanMessageEvent OnMikanMessage;

	UFUNCTION(BlueprintCallable)
	void SendMikanMessage(const FString& MessageString);

protected:
	void FreeRenderBuffers();
	void ReallocateRenderBuffers();

	void HandleMikanConnected();
	void HandleMikanDisconnected();
	void HandleAnchorListChanged();
	void HandleAnchorPoseChanged(const MikanAnchorPoseUpdateEvent& AnchorPoseEvent);
	void HandleNewVideoSourceFrame(const MikanVideoSourceNewFrameEvent& newFrameEvent);
	void HandleCameraIntrinsicsChanged();
	void HandleCameraAttachmentChanged();
	void HandleScriptMessage(const MikanScriptMessageInfo& MessageEvent);

	UPROPERTY(Transient)
	class AMikanScene* MikanScene;

	MikanClientInfo ClientInfo;
	MikanRenderTargetMemory RenderTargetMemory;
};
