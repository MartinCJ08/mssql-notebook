IF EXISTS(SELECT name FROM sysobjects WHERE name = N'sp_template' AND type = 'P')
   DROP PROCEDURE [dbo].[sp_template]
GO 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  Template for create a Stored procedure. 

  If the transaction is not open, begin the transaction and 
  close at the final. 

  return 0 if all OK, otherwise error code 
  
  Here, could be added some coments of the SP, parameters, etc...

*/
CREATE PROCEDURE [dbo].[sp_template] 
AS 
SET NOCOUNT ON
SET XACT_ABORT ON

  declare @return int = 0,
          @externalTrans bit

  set @externalTrans = case when @@trancount > 0 then 1 else 0 end 

  if @externalTrans = 0 
    begin tran

  /*
    TODO: Add the code here
  */

ExitRoutine: 
  /*
    If the transaction starts on the sp, close it
  */
  if @externalTrans = 0 
  begin 
    if @return <> 0 
      rollback tran
    else 
      commit tran 
  end

return @return 
GO